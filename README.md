# Planton

One Paragraph of project description goes here

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
Give examples
```

### Installing

Clone the repo

Emails are sent to mailcatcher

```
gem install mailcatcher
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## How are the gifs generated

Gifs are generated with an ActiveJob.

First we generate a color palette for the final gif to be beautiful, then we generate a mp4 file and finally we convert the mp4 file to a gif.

```
# Generate palette
ffmpeg -f image2 -i "PATH_TO_IMAGES-%d" -vf scale=900:-1:sws_dither=ed,palettegen "COLOR_PALETTE.png"

# Generate the movie file
ffmpeg -f image2 -framerate 1.2 -i "PATH_TO_IMAGES-%d" MOVIE_FILE_NAME.mp4

# Generate gif
ffmpeg -i "MOVIE_FILE_NAME.mp4" -i "COLOR_PALETTE.png" -filter_complex "fps=1.2,scale=500:-1:flags=lanczos[x];[x][1:v]paletteuse" "GIF_FILE_NAME.gif"
```

The temporary mp4 file is deleted afterwards.

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc

