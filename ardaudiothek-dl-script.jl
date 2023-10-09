import Pkg
Pkg.activate(".")
Pkg.instantiate()

@assert !isempty(ARGS) begin
    """
    Bitte gib eine ID für die Datei an, welche du herunterladen möchtest.
    Wenn du mehrere Dateien gleichzeitig herunterladen möchtest,
    schreibe sie einzeln hintereinander, z.B. 12345678 12345679.
    """
end

ids = tryparse.(Int, ARGS)

@assert all(id -> isa(id, Int), ids) begin
    if length(ids) == 1
        "Die ID muss eine als Integer formatierte Zahl sein, z.B. 12345678."
    else
        "Jede ID muss eine als Integer formatierte Zahl sein, z.B. 12345678."
    end
end

include("ardaudiothek-dl.jl")
for id in ids
    download_from_id(id) ? continue : println("Error downloading id $id.")
end
println("✓ Finished.")
