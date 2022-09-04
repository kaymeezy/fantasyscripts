import pandas as pd
import asyncio
from directory_downloader import DDownloader

url = "https://moneypuck.com/moneypuck/playerData/playerGameByGame/2017/regular/"
downloader = DDownloader()
await downloader.crawl(url)  # fetch all the links from /directory/
await downloader.download_files()  # download all files to current directory
