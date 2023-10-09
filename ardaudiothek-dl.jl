using Downloads
using HTTP
using JSON3

function download_from_id(id)
    # API call
    resp = HTTP.get("https://api.ardaudiothek.de/graphql/items/$id")
    # Convert response body into JSON3 object
    body = JSON3.read(resp.body)
    # Get title of audio file
    title = body.data.item.title
    # Create filename
    function try_extract_episode()
        # Try to extract an episode number if there's one
        s = split(title)
        m = match(r"\([^)]*\)", s[end])
        if !isnothing(m)
            episode = split(s[end][begin+1:end-1], "/")[1]
            return "$episode - $(join(s[begin:end-1], " ")).mp3"
        else
            return "$title.mp3"
        end
    end
    filename = try_extract_episode()
    # Get audio URL
    url = body.data.item.audios[1].url
    # Download MP3 file
    Downloads.download(url, filename)
    # TODO Handle API and download errors somehow and return false in those cases
    return true
end
