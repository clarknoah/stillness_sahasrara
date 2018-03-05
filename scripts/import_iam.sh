# This script will run iAm's uladhara import script, as well as import the DIST of I'm.
IAM_ROOT=~/Development/iAm
M_ROOT=~/Development/stillness-muladhara
S_ROOT=~/Development/stillness_sahasrara

cd $S_ROOT
rm -r dist/
cd $IAM_ROOT
./import_m.sh
ng build --prod
cp -R dist/ $S_ROOT/dist
