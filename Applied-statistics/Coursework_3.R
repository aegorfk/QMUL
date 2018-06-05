if (0) {
# plot.ccdf.R v2.0 (Apr 29th 2011)
#
# CHANGELOG:
# - v2.0 (Apr 29th 2011) added sampling support to avoid huge output files
# - v1.0 (Feb 25th 2011) first release
#
#
# Copyright 2011 Fabian Schneider. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#  1. Redistributions of source code must retain the above copyright notice,
#     this list of conditions and the following disclaimer.
#  2. Redistributions in binary form must reproduce the above copyright notice,
#     this list of conditions and the following disclaimer in the documentation
#     and/or other materials provided with the distribution.
# 
# THIS SOFTWARE IS PROVIDED BY Fabian Schneider ``AS IS'' AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
# EVENT SHALL Fabian Schneider OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY 
# OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
# EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 
# The views and conclusions contained in the software and documentation are 
# those of the authors and should not be interpreted as representing official 
# policies, either expressed or implied, of Fabian Scheider. 
}

plot.ccdf <- function (data, log = "xy", xlab = "x", ylab = "CCDF(x)", xlim
= F, ymin = 0, sample.it=F, sample.count = 100, col = 1, cex = 1) 
{
    if ( length(dim(data)) > 0) {
        cat ("Attention input is a matrix! Usign all values in it!")
    }
    x <- sort(data)

    if ( (log == "xy") || ( log == "y")) {
	if ( ymin == 0) {
	    min = ceiling(log10(length(x)))
	} else {
	    min = ceiling(log10(1/ymin))
	}
        ylab.at = (1/(10^(0:min)))
        ylab.lab = ylab.at
        yrange = c(min(ylab.at),1)
    } else {
        ylab.at = 0:10/10
        ylab.lab = ylab.at
        yrange = c(0,1)
    }

    if ( length(xlim) != 2) {
	if ( (log == "xy") || (log == "x")) { 
	    minx.log = x[ x>0 ][1]
	    xlim = c(minx.log, max(x)) 
	} else {
	    xlim = c(min(x), max(x))
	}
    }

    cat( "yrange: ", yrange, "| xrange: ", xlim, "\n")
    plot(1,1, log=log, xlab = xlab, ylab = ylab, 
	ylim = yrange, xlim = xlim, axes = F, type = 'n')
    add.ccdf(data, col = col, sample.it = sample.it, sample.count = sample.count, cex = cex)
    axis(1)
    axis(2, at = ylab.at, labels = ylab.lab)
    box()
    grid()
}

add.ccdf <- function (data, col = 2, sample.it = F, sample.count = 100, cex = 1) 
{
    if ( length(dim(data)) > 0) {
        cat ("Attention input is a matrix! Usign all values in it!")
    }
    
    x <- sort(data)
    y <- 1-((1:(length(x))-1)/length(x))

    xmin <- min(x)
    xmax <- max(x)
    ymin <- min(y)
    ymax <- max(y)

    if (sample.it) {
	if ( par("ylog") == T ) {
	    ymarks <- 10^(seq(from=log10(ymin), to = log10(ymax), length.out=sample.count))
	} else {
	    ymarks <- seq(from=ymin, to = ymax, length.out=sample.count)
	}


	if ( par("xlog") == T ) { 
	    xsbr <- 10^(seq(from=log10(xmin), to = log10(xmax), length.out=sample.count))
	} else {
	    xsbr <- seq(from=xmin, to = xmax, length.out=sample.count)
	}
	xmarks <- cumsum(table(cut(x, breaks = xsbr, labels = F)))
    }

    if ( sample.it ){
	points(x= quantile(data, probs = 1-ymarks, type =2), y = ymarks, col = col, pch = col, cex = cex)
	points(x[xmarks], y[xmarks], col=col, pch = col, cex = cex)
    } else {
	points(x,y,col = col, pch = col, cex = cex)
    }
}
