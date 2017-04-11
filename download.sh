wget ftp://ftp.fu-berlin.de/pub/misc/movies/database/ratings.list.gz && gunzip ratings.list.gz

######### Game of Thrones

cat ratings.list | grep "\"Game of Thrones\" (2011)" | tail -n +2 > got.dat

# got.dat needs to be clean

# season
awk 'BEGIN {FS = "#"}; {print $2}' got.dat | sed 's/)//' | sed 's/}//' | awk 'BEGIN {FS = "."}; {print $1}' > got.season.dat
# episode
awk 'BEGIN {FS = "#"} ; {print $2}' got.dat | sed 's/)//' | sed 's/}//' | awk 'BEGIN {FS = "."} ; {print $2}' > got.episode.dat
# rating
awk '{print $3}' got.dat > got.rating.dat



######### The Walking Dead

cat ratings.list | grep "\"The Walking Dead\" (2010)" | tail -n +2 > twd.dat

# season
awk 'BEGIN {FS = "#"}; {print $2}' twd.dat | sed 's/)//' | sed 's/}//' | awk 'BEGIN {FS = "."}; {print $1}' > twd.season.dat
# episode
awk 'BEGIN {FS = "#"} ; {print $2}' twd.dat | sed 's/)//' | sed 's/}//' | awk 'BEGIN {FS = "."} ; {print $2}' > twd.episode.dat
# rating
awk '{print $3}' twd.dat > twd.rating.dat

