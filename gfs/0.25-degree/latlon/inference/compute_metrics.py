import os
import sys
_nested_eagle = os.path.expandvars("${HOME}/nested-eagle")
sys.path.append(_nested_eagle)

import eagle.metrics

if __name__ == "__main__":
    eagle.metrics.compute_error_metrics()

