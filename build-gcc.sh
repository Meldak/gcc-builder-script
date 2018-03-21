GCC_VERSION="5.5.0" #Aqui define la version de GCC que deseas instalar
WORKDIR="$HOME/src" #Aqui define el directorio en donde instalar el codigo fuente

mkdir $WORKDIR

# Instalamos algunas dependencias para CentOS, en Ubuntu marcara error en el comando yum e ignorara estas lineas.
sudo yum groupinstall 'Development Tools'
yum install gmp-devel mpfr-devel libmpc-devel

apt-get install build-essential

# Descargamos el codigo fuente
cd $WORKDIR
wget http://www.netgull.com/gcc/releases/gcc-${GCC_VERSION}/gcc-${GCC_VERSION}.tar.gz
# Descomprimimos el codigo fuente
tar xzvf gcc-${GCC_VERSION}.tar.gz

# Descargamos los prerequisitos
cd gcc-${GCC_VERSION}
./contrib/download_prerequisites

# Creamos el directorio para el compilado
cd ..
mkdir gcc-$(GCC_VERSION)-build
cd gcc-$(GCC_VERSION)-build

# Compilamos 
../gcc-${GCC_VERSION}/configure\ #archivo de configuracion de GCC
    --enable-languages=c,c++   \ #habilitamos los lenguajes c y c++ solamente
    --disable-multilib		   \ #deshabilitamos las  multilibrerias para evitar que pida dependencias que no necesitamos

&& sudo make \ 
&& sudo make install #Instalamos


