
<?php
header('Access-Control-Allow-Origin: *');

$host = 'localhost';
$username = 'lab5_user';
$password = 'password123';
$dbname = 'dolphin_crm';

$conn = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
$regex_password = "/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])/";



if(isset($_POST['submit'])){
 
    $password = filter_var($_POST['LoginPassword'], FILTER_SANITIZE_STRING);
    $email = filter_var($_POST['LoginEmail'], FILTER_SANITIZE_EMAIL);
    if(strlen($password) >= 8 && (preg_match($regex_password, $password))){
        $query = "SELECT * FROM Users WHERE Users.email = '{$email}'";
        $stmt = $conn->query($query);
        $results = $stmt->fetchALL(PDO::FETCH_ASSOC);

        if (sizeof($results) == 1)
        {
            if($results[0]["role"] == "Admin")
            {
                if($results[0]["password"] ==  $password){
                    $_SESSION['logged-in'] = true;
                    $_SESSION['userid'] = $results[0]['id'];
                    echo "admin log in";
                    //header('Location: index.html');
                    exit;
                }
            }
            else
            {
                if(password_verify($password, $results[0]['password'])){
                    $_SESSION['logged-in'] = true;
                    $_SESSION['userid'] = $results[0]['id'];
                    echo "user log in";
                }
            }
        }

    }
}

$conn = null;

?>