let
  userName = "lafco";
  email = "vinigfalconi@outlook.com.br";
in {
  programs.git = {
    enable = true;
    userName = userName;
    userEmail = email;
  };
}
