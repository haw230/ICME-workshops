url = 'http://weather.rap.ucar.edu/surface/stations.txt'
pg = readLines(url)
pg = pg[grepl('US$', pg)] #only look at US data

state = substr(pg, 1, 2)
names = substr(pg, 4, 20)
names = gsub("[[:blank:]]+$", "", names)
coord = substr(pg, 40, 54)
coord = strsplit(coord, split='[[:blank:]]+') #with one or more blanks
coord = do.call(rbind, coord)

to_degrees = function(x, rm_chars=c('N', 'S', 'E', 'W')) { #chars to remove
  regex = paste(rm_chars, collapse = '|') #pipe means 'or'
  as.numeric(gsub(regex, '', x)) #find replace where
}

coord = apply(coord, 2, to_degrees)

convert = function(degrees, minutes) {
  degrees + (as.numeric(minutes) / 60)
}

lat = convert(degrees=coord[,1], minutes=coord[,2])
lon = convert(deg=coord[,3], min=coord[,4]) * -1

coord = data.frame(state, station=names, lon, lat)

#install.packages('ggmap')
require('ggmap')
qmap(location='US', zoom=4, maptype='satellite') + geom_point(data=coord, mapping=aes(lon, lat), color='yellow', size=1.5)

