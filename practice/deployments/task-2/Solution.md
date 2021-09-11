# Solution

Run `kubectl apply -f service.yaml` to create the service. Run `kubectl get svc` and look at the column "EXTERNAL-IP" this should shortly change from "pending" to a public IP address. Access the IP in the Browser. You should receive a "Version 1".

Update the `monitor.sh` or `monitor.ps1` and replace "<PUBLIC-IP>" with the IP of the service. Next, open another terminal and run this script. You should see a "Version 1" printed every second.



