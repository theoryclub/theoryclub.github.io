{ lib
, stdenvNoCC
, bundlerEnv
, glibcLocales
, validator-nu
, lychee
}:

stdenvNoCC.mkDerivation rec {
  name = "theoryclub";

  src = ../..;

  site = "_site";

  gems = bundlerEnv {
    name = "gems-theoryclub";
    gemdir = src;
  };

  configurePhase = ''
    runHook preConfigure

    export LOCALE_ARCHIVE="${glibcLocales}/lib/locale/locale-archive"
    export LANG=en_US.UTF-8

    runHook postConfigure
  '';

  strictDeps = true;
  nativeBuildInputs = [ gems gems.wrappedRuby ];

  buildPhase = ''
    runHook preBuild

    jekyll build

    runHook postBuild
  '';

  postBuild = ''
    # don't ignore files in .gitignore
    prettier --write ${site} --ignore-path=
  '';

  doCheck = true;
  nativeCheckInputs = [ validator-nu lychee ];
  checkPhase = ''
    runHook preCheck

    vnu --Werror --skip-non-html --filterfile .vnurc "${site}"
    vnu --Werror --skip-non-css --filterfile .vnurc "${site}"
    vnu --Werror --skip-non-svg --filterfile .vnurc "${site}"

    runHook postCheck
  '';

  installPhase = ''
    runHook preInstall

    cp -r ${site} -T $out

    runHook postInstall
  '';

  meta = with lib; {
    description = "Georgia Tech's theoretical computer science club website";
    homepage = "https://theoryclub.github.io/";
    maintainers = with maintainers; [ stephen-huan ];
  };
}
