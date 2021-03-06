fusion_dir=$1
output_dir=$2
output_prefix=$3
gene_id=$4
outlier_level=$5
plot_title=$6
plot_ylabel=$7


script_folder=$( readlink -f $0 | rev | cut -f2- -d'/' | rev)

mkdir -p $output_dir

ls $fusion_dir/*.fusion_outliers.txt | head -1 | xargs head -1 > $output_dir/$output_prefix.df.tsv
ls $fusion_dir/*.fusion_outliers.txt | while read file; do
  grep -w "^$gene_id" $file >> $output_dir/$output_prefix.df.tsv
done

Rscript $script_folder/plot_fusion_outliers.R $output_dir/$output_prefix.df.tsv $outlier_level $output_dir/$output_prefix.plot.pdf "$plot_title" "$plot_ylabel"





