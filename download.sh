wget ftp://ftp.fu-berlin.de/pub/misc/movies/database/ratings.list.gz && tar -xvf ratings.list.gz

######### Game of Thrones

cat ratings.list | grep "\"Game of Thrones\" (2011)" | tail -n +2 > got.dat

# got.dat needs to be clean

# season
awk 'BEGIN {FS = "#"}; {print $2}' got.dat | sed 's/)//' | sed 's/}//' | awk 'BEGIN {FS = "."}; {print $1}' > got.season.dat
# episode
awk 'BEGIN {FS = "#"} ; {print $2}' got.dat | sed 's/)//' | sed 's/}//' | awk 'BEGIN {FS = "."} ; {print $2}' > got.episode.dat
# rating
awk '{print $3}' got.dat > got.rating.dat
