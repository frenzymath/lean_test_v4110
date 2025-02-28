import asyncio
import logging
import os
import sys
from pathlib import Path
from tqdm.asyncio import tqdm_asyncio

# import config

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


async def analyze(analyzer_path: Path, root: Path, path: Path):
    module = ".".join(path.with_suffix("").parts)
    db_path = root / "jixia-datas"
    db_path.mkdir(parents=True, exist_ok=True)
    logger.info("analyze %s", root / path)
    args = [
        "env", analyzer_path, "-i",
        "-m", db_path / f"{module}.imp.json",
        "-d", db_path / f"{module}.decl.json",
        "-s", db_path / f"{module}.sym.json",
        "-e", db_path / f"{module}.elab.json",
        "-l", db_path / f"{module}.line.json",
        root / path,
    ]
    proc = await asyncio.create_subprocess_exec("lake", *args)
    await proc.wait()
    logger.info("finish %s", module)
    print(path, module)


async def main(analyzer_path: Path, root: Path):
    queue = asyncio.Queue()

    async def worker():
        while True:
            try:
                filename = queue.get_nowait()
            except asyncio.QueueEmpty:
                break
            await analyze(analyzer_path, root, filename)
            queue.task_done()

    num_workers = os.cpu_count()
    print(root)
    print("1\n")
    for file in root.glob("**.lean"):
        queue.put_nowait(file.relative_to(root))
    logger.info(f"{queue.qsize()} files to analyze.")

    tasks = [asyncio.create_task(worker()) for _ in range(num_workers)]
    await queue.join()
    await tqdm_asyncio.gather(*tasks)


if __name__ == '__main__':
    asyncio.run(main(Path(sys.argv[1]), Path(sys.argv[2])))
