# !/bin/bash
# HOW TO USE:
#	$ ./setup.sh

WORKDIR=$(pwd)
HOST_CONFIG_DIR="host_config"
HOST_LOGS_DIR="host_logs"
HOST_DATA_DIR="host_data"
EDIA_DATA_DIR="$WORKDIR/app/data"
TOOL_CONFIG_FILE="tool.cfg"
TOOL_CONFIG_CONTENT="
[INTERFACE]\n\
# [es | en]\n\
language            = es\n\n\
[WORD_EXPLORER]\n\
# [sklearn | ann]\n\
nn_method           = sklearn\n\
max_neighbors       = 20\n\
embeddings_path     =""\n\n\
[DATA]\n\
# [full | mini]\n\
vocabulary_subset   = full\n\
# [True | False]\n\
available_wordcloud = False\n\n\
[LOGS]\n\
# [True | False]\n\
available_logs      = True
"

if [ ! -d $WORKDIR/$HOST_CONFIG_DIR ];
then 
    echo "* Creating '$HOST_CONFIG_DIR/' directory ..."
    mkdir $WORKDIR/$HOST_CONFIG_DIR

    echo "* Creating tool.cfg config file ..."
    touch "$WORKDIR/$HOST_CONFIG_DIR/$TOOL_CONFIG_FILE"
    echo -e $TOOL_CONFIG_CONTENT > "$WORKDIR/$HOST_CONFIG_DIR/$TOOL_CONFIG_FILE"
fi

if [ ! -d $WORKDIR/$HOST_LOGS_DIR ]; 
then 
    echo "* Creating '$HOST_LOGS_DIR/' directory ..."
    mkdir $WORKDIR/$HOST_LOGS_DIR
fi

if [ ! -d $WORKDIR/$HOST_DATA_DIR ]; 
then 
    echo "* Creating '$HOST_DATA_DIR/' directory ..."
    mkdir $WORKDIR/$HOST_DATA_DIR
fi


echo "* Creating app/data/ diretory ..."
mkdir $EDIA_DATA_DIR

echo "* Download data files ..."
ID="1uI6HsBw1XWVvTEIs9goSpUVfeVJe-zEP"
wget -q --show-progress "https://drive.google.com/uc?export=download&id=$ID&export=download&confirm=yes" -O "$EDIA_DATA_DIR/mini_vocab_v6.zip"
ID="1T_pLFkUucP-NtPRCsO7RkOuhMqGi41pe"
wget -q --show-progress "https://drive.google.com/uc?export=download&id=$ID&export=download&confirm=yes" -O "$EDIA_DATA_DIR/full_vocab_v6.zip"
ID="1EN0pp1RKyRwi072QhVWJaDO8KlcFZo46"
wget -q --show-progress "https://drive.google.com/uc?export=download&id=$ID&export=download&confirm=yes" -O "$EDIA_DATA_DIR/100k_en_embedding.vec"
ID="1YwjyiDN0w54P55-y3SKogk7Zcd-WQ-eQ"
wget -q --show-progress "https://drive.google.com/uc?export=download&id=$ID&export=download&confirm=yes" -O "$EDIA_DATA_DIR/100k_es_embedding.vec"