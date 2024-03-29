% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/logisticRR.R
\name{logisticRR}
\alias{logisticRR}
\title{Calculate adjusted relative risks}
\usage{
logisticRR(
  formula,
  basecov = 0,
  fixcov = NULL,
  data,
  boot = FALSE,
  n.boot = 100
)
}
\arguments{
\item{formula}{a formula term that is passed into \code{glm()} having a form of \code{response ~ terms} where \code{response} is binary response vector and \code{terms} is a collection of terms connected by \code{'+'}. The first term of predictors will be used as a predictor of interest to calculate relative risks with respect to response variable.}

\item{basecov}{a baseline value of exposure variable. Defaults to \code{0}.}

\item{fixcov}{a data frame of fixed value for each of adjusted confounders. If there is no confounder other than an exposure variable of interest, \code{fixcov} = \code{NULL}; if \code{fixcov} is missing for covariates, they are all set to \code{0} (for numerical covariates) or first levels (for factor covariates).}

\item{data}{a data frame containing response variable and all the terms used in \code{formula}.}

\item{boot}{a logical value whether bootstrap samples are generated or not. Defaults to \code{FALSE}.}

\item{n.boot}{if \code{boot =  TRUE}, the number of bootstrap samples. Defaults to \code{100}.}
}
\value{
\item{\code{fit}}{an object of class \code{glm}.}
\item{\code{RR}}{(conditional) relative risk in response under exposure at baseline (\code{basecov}) and \code{basecov + 1}.}
\item{\code{delta.var}}{estimated variance of relative risk (\code{RR}) using Delta method.}
\item{\code{boot.rr}}{if \code{boot = TRUE}, a vector of \code{RR}'s using bootstrap samples.}
\item{\code{boot.var}}{estimated sampled variance using bootstraps if \code{boot = TRUE}.}
\item{\code{fix.cov}}{a data frame of fixed value for each of adjsuted confounders.}
}
\description{
When response variable is binary and exposure variable is binary or continuous,
this function derives adjusted relative risks conditional on fixed other confounders' value
from logistic regression.
}
\examples{
n <- 500
set.seed(1234)
X <- rbinom(n, 1, 0.3)
W <- rbinom(n, 1, 0.3);
W[sample(1:n, n/3)] = 2
Y <- rbinom(n, 1, plogis(X - W))
dat <- as.data.frame(cbind(Y, X, W))
result <- logisticRR(Y ~ X + W, basecov = 0, data = dat,
                    boot = TRUE, n.boot = 200)


}
\author{
Youjin Lee
}
