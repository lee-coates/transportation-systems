@echo off

pushd %~dp0

set DOCSDIR=docs 
set TESTSDIR=tests
set SRCDATADIR=src\data
set SRCFEATURESDIR=src\features
set DATAOUTDIR=data
set MODELSOUTDIR=models
set VIZOUTDIR=visualizations
set REPORTSOUTDIR=reports

if "%1" == "docs" goto docs

:docs
%DOCSDIR%\make.bat html

:raw_data
%SRCDATADIR%\get_data.py %DATAOUTDIR%\raw

:processed_data
%SRCDATADIR%\make_dataset.py %DATAOUTDIR%\processed

:features
%SRCFEATURESDIR%\build_features.py %MODELSOUTDIR%

:train_model
%SRCFEATURESDIR%\train_model.py %MODELSOUTDIR%

:predict_model
%SRCFEATURESDIR%\predict_model.py %MODELSOUTDIR%

:visualizations
%VIZOUTDIR%\visualize.py %REPORTSOUTDIR%

:tests
%TESTSDIR%

:end
popd
