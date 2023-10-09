# ardaudiothek-dl

This is a simple [Julia](julialang.org) script to download audio files from [ARD Audiothek](https://www.ardaudiothek.de/).

**Usual disclaimer:**
There's no guarantee here that this thing works as you would expect it to.
In fact, I myself wouldn't even expect it to work for the foreseeable future (or even right now for that matter but that's a different topic).
APIs and websites change all the time and public broadcasting companies aren't exactly known for their forward-looking decision-making when it comes to digitalisation.
So if there's something broken or if you're missing anything, feel free to fix it yourself or (preferrably) submit a bug report or PR to fix it together.

Having said that: Have fun! :)

## Usage

1. Clone the repository.
2. Run as script or package.

### Script

Run `julia ardaudiothek-dl-script.jl $ID` from your shell where `$ID` is the ARD Audiothek identifier of the audio file in question.

(Hint: The identifier can easily be retrieved by hovering over the file names on the ARD Audiothek website and looking at their URLs.)

### Package

Open Julia in the ardaudiothek-dl environment (remember to run `]instantiate` on first run) and then `include("ardaudiothek-dl.jl")`.
Finally invoke `download_from_id(id)` as many times as you want where `id` is the ARD Audiothek identifier of the audio file in question.

## License

See [LICENSE](LICENSE) file.
