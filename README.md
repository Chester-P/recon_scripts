# recon_scirpts
### append_domain.sh
Permutate wordlist against a file of subdomains or from stdin

[zdns](https://github.com/zmap/zdns) is a great tool
```
./append_domains.sh subdomain-max.txt subdomains | zdns ANY -conf-file resolvers.txt -retries 10 -threads 100 | grep -v NXDOMAIN | tee bruteforce_result 2> errors
```
