process microarray_analysis {
    input:
    path data from file('microarray_data.csv')
    
    output:
    path 'microarray_pca.png' into result

    script:
    """
    python microarray_analysis.py $data
    """
}
