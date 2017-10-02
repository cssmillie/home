library(methods)

if(interactive()){
options(menu.graphics=FALSE)
setHook(packageEvent("grDevices", "onLoad"),
function(...) grDevices::X11.options(type='Xlib'))
options(device='x11')
}

fixx11 = function(big=F){
    if(big == T){w = 12.5; h = 7} else{w = 8; h = 7}
    graphics.off()
    display=gsub('.*DISPLAY.', '', tail(readLines('~/.qrsh.display'), n=1))
    x11(display, width=w, height=h, type='Xlib', xpos=-1)
}

seurat = function(){source('~/code/single_cell/seurat.r')}

ffread = function(a, row.names=NULL){
    library(data.table)
    if(grepl('gz', a)){
        h = strsplit(readLines(a, n=1), '\\s+')[[1]]
	x = fread(paste0('zcat ', a), skip=1, header=F)
    } else {
        h = strsplit(readLines(a, n=1), '\\s+')[[1]]
	x = fread(a, skip=1, header=F)
    }
    if(length(h) == (ncol(x)-1)){
        print('Setting row.names = 1')
        row.names = 1
    }
    x = data.frame(x, row.names=row.names)
    if(length(h) == ncol(x)){
        colnames(x) = h
    } else if(length(h) == ncol(x)+1){
        colnames(x) = h[2:length(h)]
    } else {
        stop('error: file dimensions')
    }
    return(x)
}
