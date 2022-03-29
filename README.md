# BiocBinaryRepositoryPackageTools

WIP package of ideas for querying available Bioconductor binary packages

If package name needs to change, we'll change it. <please add suggestions>

## WISHLIST

1. AnVIL:::respository_stats() like function should work outside of containers with the right parameters. Stats without being on container

        BiocBinaryTools::binary_repo_stats(version = '3.15', container = c('bioconductor_docker', 'terra-jupyter'))

2. Build status / report

        BiocBinaryTools::binary_build_report(version, container)

    Returns:

        tibble with colnames Package, Status, error_url (or something like that.)

3. Package failure reason, Access reasons for failure

        
        BiocBinaryPkgTools::get_failed_pkg(package_name)
        
4. Download and read build report of package to see what caused the failure. 
        
        get_failure_reason(package_name)
        
5. Download statistics

        Number of each package, total GB, 
        
6. Should only work for Bioconductor admin - $cost


7. AnVIL versus non-AnVIL downloads? Google region?

8. Database to access failures and time for binary builds.
