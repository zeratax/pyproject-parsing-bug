{ pkgs ? import <nixpkgs> { } }:
let
  env = pkgs.poetry2nix.mkPoetryEnv {
    python = pkgs.python3;
    pyproject = ./pyproject.toml;
    poetrylock = ./poetry.lock;
  };
in
pkgs.runCommand "parsing-test"
{ } ''
  ${env}/bin/test-script
  ${env}/bin/test-alt-script
  ${env}/bin/test-package-script
''
