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

  env.LOCALE_ARCHIVE = "${glibcLocales}/lib/locale/locale-archive";
  env.LC_ALL = "en_US.UTF-8";

  strictDeps = true;
  nativeBuildInputs = [ gems gems.wrappedRuby ];

  buildPhase = ''
    runHook preBuild

    jekyll build

    runHook postBuild
  '';

  doCheck = true;
  nativeCheckInputs = [ validator-nu lychee ];
  checkPhase = ''
    runHook preCheck

    vnu --Werror --skip-non-html --filterfile .vnurc "${site}"
    vnu --Werror --skip-non-css --filterfile .vnurc "${site}"
    vnu --Werror --skip-non-svg --filterfile .vnurc "${site}"
    lychee --offline _site

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
