import datetime
import logging
import time


VERSION = "1.0.0"


logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(filename)s:%(lineno)d %(levelname)s] %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)


if __name__ == "__main__":
	logging.info(f"running hello world version {VERSION}...")
	while True:
		logging.info(datetime.datetime.utcnow().isoformat()[0:19])
		time.sleep(10)
