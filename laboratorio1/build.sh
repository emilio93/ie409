# build pdf graphs from svg sources
cd modelica/graficas
./svg2pdf.sh
cd ../..

# listings modelica()
cd ..
git clone https://github.com/modelica-tools/listings-modelica.git
cd laboratorio1

# -n to avoid overwrite
cp -n names.tex.default names.tex

# create output folder incase it doesn't exist
mkdir -p ../build
mkdir -p ../build/laboratorio1

# compile pdf
pdflatex -jobname=Lab01_Grupo1_B00000_B11111_B22222 --output-directory=../build/laboratorio1 laboratorio1.tex
pdflatex -jobname=Lab01_Grupo1_B00000_B11111_B22222 --output-directory=../build/laboratorio1 laboratorio1.tex
