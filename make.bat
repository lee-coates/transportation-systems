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
if "%1" == "raw_data" goto raw_data
if "%1" == "processed_data" goto processed_data
if "%1" == "features" goto features
if "%1" == "train_model" goto train_model
if "%1" == "predict_model" goto predict_model
if "%1" == "visualizations" goto visualizations
if "%1" == "tests" goto tests
if "%1" == "all" goto all

:all
%SRCDATADIR%\get_data.py %DATAOUTDIR%\raw
%SRCDATADIR%\make_dataset.py %DATAOUTDIR%\processed
%SRCFEATURESDIR%\build_features.py %MODELSOUTDIR%
%SRCFEATURESDIR%\train_model.py %MODELSOUTDIR%
%SRCFEATURESDIR%\predict_model.py %MODELSOUTDIR%
%VIZOUTDIR%\visualize.py %REPORTSOUTDIR%

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
