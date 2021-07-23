{
  pkgs,
  ...
}:
  let
    company-mkdocs = pkgs.callPackage ./company/mkdocs {};
    company-docs   = pkgs.callPackage ./company/docs-site { inherit company-mkdocs; };
  in
    {
      company = {
        mkdocs    = company-mkdocs;
        docs-site = company-docs;
      };
    }
