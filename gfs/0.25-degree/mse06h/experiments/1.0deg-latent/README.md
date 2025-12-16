# 1/4 degree latlon mesh



## 2x16 Encoders

2 encoders, with same encoder structure as 1 degree model, and with the
trainable parameters
* 107M parameters
* 4 gpus per model: 1.3 - 1.4 it/s
* 2 gpus per model: .7 it/s

```
  | Name    | Type                 | Params | Mode
---------------------------------------------------------
0 | model   | AnemoiModelInterface | 107 M  | train
1 | loss    | MSELoss              | 0      | train
2 | metrics | ModuleDict           | 0      | train
---------------------------------------------------------
107 M     Trainable params
0         Non-trainable params
107 M     Total params
429.143   Total estimated model params size (MB)
304       Modules in train mode
0         Modules in eval mode
```

## 1024 channels, 2x8 encoders

```
  | Name    | Type                 | Params | Mode
---------------------------------------------------------
0 | model   | AnemoiModelInterface | 290 M  | train
1 | loss    | MSELoss              | 0      | train
2 | metrics | ModuleDict           | 0      | train
---------------------------------------------------------
290 M     Trainable params
0         Non-trainable params
290 M     Total params
1,160.460 Total estimated model params size (MB)
304       Modules in train mode
0         Modules in eval mode
```


## 1x16 encoders

Note that this contains isolated nodes

```
  | Name    | Type                 | Params | Mode
---------------------------------------------------------
0 | model   | AnemoiModelInterface | 115 M  | train
1 | loss    | MSELoss              | 0      | train
2 | metrics | ModuleDict           | 0      | train
---------------------------------------------------------
115 M     Trainable params
0         Non-trainable params
115 M     Total params
463.027   Total estimated model params size (MB)
280       Modules in train mode
0         Modules in eval mode
```
