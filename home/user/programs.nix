{ inputs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.lafco = {
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        bypass-paywalls-clean
        facebook-container
        i-dont-care-about-cookies
        to-google-translate
        ublock-origin
        youtube-shorts-block
      ];
    };
  };
}
