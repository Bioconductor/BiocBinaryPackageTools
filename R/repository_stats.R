#'
#'
#' @export
repository_stats <-
    function(version = character(),
             image = character())
{
    if (! nzchar(version)) {
        version <- BiocManager::version()
        message('Repository stats shown are for Bioconductor: ', version)
    }


    
#    version = '3.12'
    rel313 <- "https://storage.googleapis.com/bioconductor_docker/packages/3.13/bioc/src/contrib/PACKAGES"
    rel312 <- "https://storage.googleapis.com/bioconductor_docker/packages/3.12/bioc/src/contrib/PACKAGES"
    
    binary_base_url = gsub(pattern = 'src/contrib/PACKAGES', '', rel312)
    
    bioc_repository <- paste0("https://bioconductor.org/packages/", version, "/bioc")
    
    db_bioc <- available.packages(repos = bioc_repository)
    
    db_binary <- available.packages(repos = binary_base_url)
    binary_repository <- binary_base_url 
    packages <- paste0(contrib.url(binary_repository), "/PACKAGES")

    missing_binaries <- setdiff(rownames(db_bioc), rownames(db_binary))
    
    found_binaries <- intersect(rownames(db_bioc), rownames(db_binary))
    bioc_versions <- package_version(db_bioc[found_binaries, "Version"])
    binary_versions <- package_version(db_binary[found_binaries, 
                                                 "Version"])
    binary_out_of_date <- bioc_versions > binary_versions
    n_out_of_date_binaries <- sum(binary_out_of_date)
    out_of_date_binaries <- found_binaries[binary_out_of_date]
    
    result <- list(
        bioconductor_version = version, bioconductor_binary_repository = if (length(binary_repository)) binary_repository else NA_character_, 
        repository_exists = length(binary_repository) > 0L, n_software_packages = nrow(db_bioc), 
        n_binary_packages = nrow(db_binary), n_binary_software_packages = length(found_binaries), 
        n_missing_binaries = length(missing_binaries), out_of_date_binaries = out_of_date_binaries)
    
    result
}
