with import <nixpkgs> {};
let dsPythonPackages = pythonPackages: with pythonPackages; [
  ipython
];
in stdenv.mkDerivation rec {
  name = "env";
  env = buildEnv {name = name; paths = buildInputs; };
  buildInputs = [
    (python38.withPackages dsPythonPackages)
    woff2
    fontforge
    #github.com/kseo/sfnt2woff
    gnumake
    ttfautohint
    zip
  ];
  shellHook = "fish";
}

