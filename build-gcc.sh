GCC_VERSION="5.5.0" #Aqui define la version de GCC que deseas instalar
WORKDIR="$HOME/src" #Aqui define el directorio en donde instalar el codigo fuente

mkdir $WORKDIR

#instalamos algunas dependencias para CentOS, en Ubuntu solo marcara error en el comando yum a ignorara estos.
sudo yum groupinstall 'Development Tools'
yum install gmp-devel mpfr-devel libmpc-devel

# descargamos el codigo fuente
cd $WORKDIR
wget http://www.netgull.com/gcc/releases/gcc-${GCC_VERSION}/gcc-${GCC_VERSION}.tar.gz
#Descomprimimos el codigo fuente
tar xzvf gcc-${GCC_VERSION}.tar.gz

# descargamos los prerequisitos
cd gcc-${GCC_VERSION}
./contrib/download_prerequisites

# creamos el directorio para el compilado
cd ..
mkdir gcc-$(GCC_VERSION)-build
cd gcc-$(GCC_VERSION)-build

# compilamos 
../gcc-${GCC_VERSION}/configure\ #archivo de configuracion de GCC
    --enable-languages=c,c++   \ #habilitamos los lenguajes c y c++ solamente
    --disable-multilib		   \ #deshabilitamos las  multilibrerias para evitar que pida dependencias que no necesitamos

&& sudo make \ 
&& sudo make install #Instalamos


