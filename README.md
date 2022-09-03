# experiment_flyio_terraform

With terraform fly version 0.0.14, I'm seeing an issue `Error: fly wireguard tunnel must be open`

See related: https://github.com/fly-apps/terraform-provider-fly/issues/65

Solution is supposed to be:

> To communicate with the Fly Machines API (which is what the Terraform provider does), you must open a WireGuard tunnel or proxy the API through the CLI.

https://fly.io/docs/reference/private-networking/#private-network-vpn

Ran the following commands following docs and it still didn't work:

`sudo apt install wireguard`

`fly wireguard create personal ewr tf-fly`

called the file `tf_wireguard.conf` at prompt

`sudo apt install wireguard-tools openresolv`

`sudo cp tf_wireguard.conf /etc/wireguard`

`wg-quick up tf_wireguard`
