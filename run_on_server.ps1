# 

param (
    [string]$server = "steponmy.com",
    [string]$username = "root",
    [string]$githubuser = "maxspad"
)

# Get repository name 
$repo_name = $(Get-Item $PSScriptRoot).Name
Write-Output "Server: $server"
Write-Output "Username: $username"
Write-Output "GithubUser: $githubuser"
Write-Output "Repo name: $repo_name"

ssh "$username@$server" "git clone https://github.com/$githubuser/$repo_name"
scp -r .\secrets "${username}@${server}:~/${repo_name}/secrets"
ssh "$username@$server" "cd ~/$repo_name && docker-compose up -d --build"
Write-output "Server should be running!"