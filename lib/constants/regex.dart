library regex_utils;

RegExp get markdownFilesRegex =>
    new RegExp(r"content\/(?!_)[A-Za-z0-9-]+(.md)$");
RegExp get markdownTitleRegex => new RegExp(r"^(# )(.+)");
