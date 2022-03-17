# BiocBinaryTools

WIP package of ideas for querying available Bioconductor binary packages

If package name needs to change, we'll change it. <please add suggestions>

## WISHLIST

1. AnVIL:::respository_stats() like function should work outside of containers with the right parameters

        BiocBinaryTools::binary_repo_status(version = '3.15', container = c('bioconductor_docker', 'terra-jupyter'))

2. Build status / report 

        BiocBinaryTools::binary_build_report(version, container)

    Returns:

        tibble with colnames Package, Status, error_url (or something like that.)

NOTE: please add to the wishlist here