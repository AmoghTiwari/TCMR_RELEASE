# My README

# Installation
## Error - 1
```Traceback (most recent call last):
  File "demo.py", line 21, in <module>
    from lib.models.smpl import SMPL, SMPL_MODEL_DIR
  File "/data/amogh/projects/TCMR_RELEASE/lib/models/__init__.py", line 1, in <module>
    from .tcmr import TCMR
  File "/data/amogh/projects/TCMR_RELEASE/lib/models/tcmr.py", line 8, in <module>
    from lib.models.spin import Regressor
  File "/data/amogh/projects/TCMR_RELEASE/lib/models/spin.py", line 13, in <module>
    from lib.models.smpl import SMPL, SMPL_MODEL_DIR, H36M_TO_J14, SMPL_MEAN_PARAMS
  File "/data/amogh/projects/TCMR_RELEASE/lib/models/smpl.py", line 8, in <module>
    from smplx.body_models import ModelOutput
ImportError: cannot import name 'ModelOutput' from 'smplx.body_models' (/data/groot/miniconda3/envs/vibe_env/lib/python3.7/site-packages/smplx/body_models.py)
```
`python -m pip uninstall smplx`
`python -m pip install smplx==0.1.13`

## Ignored Necessary Files
`$ROOT/data`
