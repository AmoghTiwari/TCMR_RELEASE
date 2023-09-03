# My README

# Ignored but required files
- `$ROOT/data`
- `~/.torch/models/yolov3.weights`
- `$ROOT/output`

# Install Required Packages
```bash scripts/install_conda.sh```

# Demo Command
`python demo.py --vid_file demo.mp4 --gpu 0`

# Errors
## TypeError: 'numpy._DTypeMeta' object is not subscriptable 
```Traceback (most recent call last):
  File "/data/amogh/projects/TCMR_RELEASE/demo.py", line 24, in <module>
    import cv2
  File "/data/groot/miniconda3/envs/tcmr_env/lib/python3.9/site-packages/cv2/__init__.py", line 181, in <module>
    bootstrap()
  File "/data/groot/miniconda3/envs/tcmr_env/lib/python3.9/site-packages/cv2/__init__.py", line 175, in bootstrap
    if __load_extra_py_code_for_module("cv2", submodule, DEBUG):
  File "/data/groot/miniconda3/envs/tcmr_env/lib/python3.9/site-packages/cv2/__init__.py", line 28, in __load_extra_py_code_for_module
    py_module = importlib.import_module(module_name)
  File "/data/groot/miniconda3/envs/tcmr_env/lib/python3.9/importlib/__init__.py", line 127, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "/data/groot/miniconda3/envs/tcmr_env/lib/python3.9/site-packages/cv2/typing/__init__.py", line 69, in <module>
    NumPyArrayGeneric = numpy.ndarray[typing.Any, numpy.dtype[numpy.generic]]
TypeError: 'numpy._DTypeMeta' object is not subscriptable
```

### Solution
`pip3 uninstall opencv-python` <br/>
`pip3 install opencv-python==4.6.0.66`

## ImportError: cannot import name 'ModelOutput' from 'smplx.body_models'
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
### Solution
`python -m pip uninstall smplx` <br/>
`python -m pip install smplx==0.1.13`

## AssertionError: Path data/base_data/SMPL_NEUTRAL.pkl does not exist!
Traceback (most recent call last):
  File "/data/amogh/projects/TCMR_RELEASE/demo.py", line 399, in <module>
    main(args)
  File "/data/amogh/projects/TCMR_RELEASE/demo.py", line 115, in main
    model = TCMR(
  File "/data/amogh/projects/TCMR_RELEASE/lib/models/tcmr.py", line 131, in __init__
    self.regressor = Regressor()
  File "/data/amogh/projects/TCMR_RELEASE/lib/models/spin.py", line 226, in __init__
    self.smpl = SMPL(
  File "/data/amogh/projects/TCMR_RELEASE/lib/models/smpl.py", line 65, in __init__
    super(SMPL, self).__init__(*args, **kwargs)
  File "/data/groot/miniconda3/envs/tcmr_env/lib/python3.9/site-packages/smplx/body_models.py", line 183, in __init__
    assert osp.exists(smpl_path), 'Path {} does not exist!'.format(
AssertionError: Path data/base_data/SMPL_NEUTRAL.pkl does not exist!
### Solution
Go to `https://smplify.is.tue.mpg.de/` and download "SMPLIFY_CODE_V2.zip" and extract the files. In the extracted directory, go to `mpips_smplify_public_v2/smplify_public/code/models` and move `basicModel_neutral_lbs_10_207_0_v1.0.0.pkl` to `<tcmr_repo>/data/base_data/SMPL_NEUTRAL.pkl`

## Traceback (most recent call last): RuntimeError: view size is not compatible with input tensor's size and stride (at least one dimension spans across two contiguous subspaces). Use .reshape(...) instead.
  File "/data/amogh/projects/TCMR_RELEASE/demo.py", line 399, in <module>
    main(args)
  File "/data/amogh/projects/TCMR_RELEASE/demo.py", line 203, in main
    output = model(batch)[0][-1]
  File "/data/groot/miniconda3/envs/tcmr_env/lib/python3.9/site-packages/torch/nn/modules/module.py", line 1130, in _call_impl
    return forward_call(*input, **kwargs)
  File "/data/amogh/projects/TCMR_RELEASE/lib/models/tcmr.py", line 146, in forward
    smpl_output = self.regressor(feature, is_train=is_train, J_regressor=J_regressor)
  File "/data/groot/miniconda3/envs/tcmr_env/lib/python3.9/site-packages/torch/nn/modules/module.py", line 1130, in _call_impl
    return forward_call(*input, **kwargs)
  File "/data/amogh/projects/TCMR_RELEASE/lib/models/spin.py", line 265, in forward
    pred_output = self.smpl(
  File "/data/groot/miniconda3/envs/tcmr_env/lib/python3.9/site-packages/torch/nn/modules/module.py", line 1130, in _call_impl
    return forward_call(*input, **kwargs)
  File "/data/amogh/projects/TCMR_RELEASE/lib/models/smpl.py", line 74, in forward
    smpl_output = super(SMPL, self).forward(*args, **kwargs)
  File "/data/groot/miniconda3/envs/tcmr_env/lib/python3.9/site-packages/smplx/body_models.py", line 373, in forward
    vertices, joints = lbs(betas, full_pose, self.v_template,
  File "/data/groot/miniconda3/envs/tcmr_env/lib/python3.9/site-packages/smplx/lbs.py", line 205, in lbs
    J_transformed, A = batch_rigid_transform(rot_mats, J, parents, dtype=dtype)
  File "/data/groot/miniconda3/envs/tcmr_env/lib/python3.9/site-packages/smplx/lbs.py", line 347, in batch_rigid_transform
    rel_joints.view(-1, 3, 1)).view(-1, joints.shape[1], 4, 4)
RuntimeError: view size is not compatible with input tensor's size and stride (at least one dimension spans across two contiguous subspaces). Use .reshape(...) instead.

### Solution
In ` vim /data/groot/miniconda3/envs/tcmr_env/lib/python3.9/site-packages/smplx/lbs.py` file, replace all `.view()` with `.replace()`

