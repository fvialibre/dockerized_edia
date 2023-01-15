# EDIA: Stereotypes and Discrimination in Artificial Intelligence
> This is an adaptation of the original version of EDIA, which will allow you to build and run the tool from a docker image.

[[Paper]](https://arxiv.org/abs/2207.06591) [[HuggingFace🤗 Demo]](https://huggingface.co/spaces/vialibre/edia) 

Language models and word representations obtained with machine learning contain discriminatory stereotypes. Here we present the EDIA project (Stereotypes and Discrimination in Artificial Intelligence). This project aimed to design and evaluate a methodology that allows social scientists and domain experts in Latin America to explore biases and discriminatory stereotypes present in word embeddings (WE) and language models (LM). It also allowed them to define the type of bias to explore and do an intersectional analysis using two binary dimensions (for example, female-male intersected with fat-skinny).

EDIA contains several functions that serve to detect and inspect biases in natural language processing systems based on language models or word embeddings. We have models in Spanish and English to work with and explore biases in different languages ​​at the user's request. Each of the following spaces contains different functions that bring us closer to a particular aspect of the problem of bias and they allow us to understand different but complementary parts of it.

You can test and explore this functions with our live demo hosted on HuggingFace🤗 by clicking [here](https://huggingface.co/spaces/vialibre/edia).


## Setup and Use

> Prerequisites: Have [DockerEngine](https://docs.docker.com/engine/install) installed on your OS.

```sh
# --- 1. Clone this repo ---
$ git clone https://github.com/fvialibre/dockerized_edia.git && cd dockerized_edia 

# --- 2. Give execute permissions to .sh files. ---
$ sudo chmod +x setup.sh build_image.sh run_image.sh

# --- 3. Setup work environment ---
# This will create the necessary folders and download the data files to be able to generate the docker image.
$ ./setup.sh

# --- 4. Build the docker image ---
## Option A: Via local app/
$ ./build_image.sh <docker_image_name>

## Option B: Downloading the latest image from Docker Hub (coming soon)
$ sudo docker pull fvialibre/edia:latest

# --- 5. Run the docker image --- 
# Create a new <container_name> and run it. The EDIA tool will be available at the address http://localhost:<host_port> in few minutes.
$ ./run_image.sh <docker_image_name> <container_name> <host_port>
```

### How to stop/delete and restart the created <container_name>
```sh
# ---  Stop the <container_name> container ---
# (Stop EDIA tool)
$ sudo docker stop <container_name>

# --- Start/Restart the <container_name> container  ---
# (Start/Restart EDIA tool)
$ sudo docker start/restart <container_name>

# --- Remove the <container_name> container  ---
# (After this you need to run the ./run_image.sh command to use the EDIA tool again)
$ sudo docker rm <container_name>
```

### Permanently remove the EDIA docker image from your local.
```sh 
$ sudo docker rmi <docker_image_name>
```

## Tool Configuration

Before execute `./run_image.sh`, you can configure the tool through `host_config/tool.cfg` file. This contains the below configuration parameters:

| **Name** | **Options** | **Description** |
|---|---|---|
| language | `es`, `en` | Changes the interface language |
| embeddings_path | `your_embedding_file.vec` | Path to word embeddings to use. You can use your own embedding file as long as it is in `.vec` format, and host it the `host_data/` directory created automatically when you run `./setup.sh`. If it's a `.bin` extended file, only gensims c binary format are valid. if this field is left empty, the tool will use two default embedding files according to the configured language. |
| nn_method | `sklearn`, `ann` | Method used to fetch nearest neighbors. Sklearn uses [sklearn nearest neighbors](https://scikit-learn.org/stable/modules/neighbors.html) exact calculation so your embedding must fit in your computer's memory, it's a slower approach for large embeddings. [Ann](https://pypi.org/project/annoy/1.0.3/) is a approximate nearest neighbors search suitable for large embeddings that don't fit in memory |
| max_neighbors | (int) `20` | Select amount of neighbors to fit sklearn nearest neighbors method. |
| vocabulary_subset | `mini`, `full` | Vocabulary necessary for context search tool |
| available_wordcloud | `True`, `False` | Show wordcloud in "Data" interface |
| available_logs | `True`, `False` | Activate logging of user's input. Saved logs will be stores in `host_logs/` folder. |                                               

## Resources
### Videotutorials and user's manual
* Word explorer: [[video]]() [manual: [es](https://shorturl.at/cgwxJ) | en]
* Word bias explorer: [[video]]() [manual: [es](https://shorturl.at/htuEI) | en]
* Phrase bias explorer: [[video]]() [manual: [es](https://shorturl.at/fkBL3) | en]
* Data explorer: [[video]]() [manual: [es](https://shorturl.at/CIVY6) | en]
* Crows-Pairs: [[video]]() [manual: [es](https://shorturl.at/gJLTU) | en]

## Citation Information
```c
@misc{https://doi.org/10.48550/arxiv.2207.06591,
    doi = {10.48550/ARXIV.2207.06591},
    url = {https://arxiv.org/abs/2207.06591},
    author = {Alemany, Laura Alonso and Benotti, Luciana and González, Lucía and Maina, Hernán and Busaniche, Beatriz and Halvorsen, Alexia and Bordone, Matías and Sánchez, Jorge},
    keywords = {Computation and Language (cs.CL), Artificial Intelligence (cs.AI), 
    FOS: Computer and information sciences, FOS: Computer and information sciences},
    title = {A tool to overcome technical barriers for bias assessment in human language technologies},
    publisher = {arXiv},
    year = {2022},
    copyright = {Creative Commons Attribution Non Commercial Share Alike 4.0 International}
}
```

## License Information 
This project is under a [MIT license](LICENSE).

