#Updates the Sahasrara Docker File

IAM_ROOT=~/Development/iAm
M_ROOT=~/Development/stillness-muladhara
S_ROOT=~/Development/stillness_sahasrara
IAM_M_IMPORT=import_m.sh

cd $S_ROOT/scripts
./import_iam.sh
cd $S_ROOT

docker build -t clarknoah/stillness_sahasrara:v0.0.1 .
docker push clarknoah/stillness_sahasrara:v0.0.1
