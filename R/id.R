#' Lookup Users and Groups on a system
#'
#' These functions use the GETPWENT(3) and GETGRENT(3) system calls to query
#' users and groups respectively.
#'
#' @return They return their results in a `data.frame`. On windows both
#'   functions return an empty `data.frame` because windows does not have user
#'   or group ids.
#' @name id
#' @export
#' @examples
#' # list first 6 groups
#' head(group_ids())
#'
#' # list first 6 users
#' head(user_ids())
group_ids <- function() {
  res <- .Call(fs_groups_)
  res <- unique(res[order(res$group_id), ])
  row.names(res) <- NULL
  res
}


#' @rdname id
#' @export
user_ids <- function() {
  res <- .Call(fs_users_)
  res <- unique(res[order(res$user_id), ])
  row.names(res) <- NULL
  res
}
