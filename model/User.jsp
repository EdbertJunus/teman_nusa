<%! 
    public class User{
        private Integer UserId;
        private String UserGender;
        private String UserLinkedIn;
        private String UserHandphone;
        private Integer UserRegisterPrice;
        private String UserEmail;
        private String UserPassword;
        private String UserFullName;
        private Integer UserWalletId;
        private String UserAccountType;


        public User(String userGender, String userLinkedIn, String userHandphone,
			Integer userRegisterPrice, String userEmail, String userPassword, String userFullName
			) {
            super();
            UserId=0;
            UserGender = userGender;
            UserLinkedIn = userLinkedIn;
            UserHandphone = userHandphone;
            UserRegisterPrice = userRegisterPrice;
            UserEmail = userEmail;
            UserPassword = userPassword;
            UserFullName = userFullName;
            UserWalletId = 0;
            UserAccountType = "Public";
        }
        
        public Integer getUserId() {
            return UserId;
        }
        public void setUserId(Integer userId) {
            UserId = userId;
        }
        public String getUserGender() {
            return UserGender;
        }
        public void setUserGender(String userGender) {
            UserGender = userGender;
        }
        public String getUserLinkedIn() {
            return UserLinkedIn;
        }
        public void setUserLinkedIn(String userLinkedIn) {
            UserLinkedIn = userLinkedIn;
        }
        public String getUserHandphone() {
            return UserHandphone;
        }
        public void setUserHandphone(String userHandphone) {
            UserHandphone = userHandphone;
        }
        public Integer getUserRegisterPrice() {
            return UserRegisterPrice;
        }
        public void setUserRegisterPrice(Integer userRegisterPrice) {
            UserRegisterPrice = userRegisterPrice;
        }
        public String getUserEmail() {
            return UserEmail;
        }
        public void setUserEmail(String userEmail) {
            UserEmail = userEmail;
        }
        public String getUserPassword() {
            return UserPassword;
        }
        public void setUserPassword(String userPassword) {
            UserPassword = userPassword;
        }
        public String getUserFullName() {
            return UserFullName;
        }
        public void setUserFullName(String userFullName) {
            UserFullName = userFullName;
        }
        public Integer getUserWalletId() {
            return UserWalletId;
        }
        public void setUserWalletId(Integer userWalletId) {
            UserWalletId = userWalletId;
        }
        public String getUserAccountType() {
            return UserAccountType;
        }
        public void setUserAccountType(String userAccountType) {
            UserAccountType = userAccountType;
        }
    }
%>