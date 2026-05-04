{ pkgs, ... }:

{
    networking.networkmanager.enable = true;

    environment.systemPackages = with pkgs; [
        networkmanagerapplet
    ];

    # networking.networkmanager.ensureProfiles.profiles = {
    #     Vodafone-9AA9 = {
    #         connection = {
    #             autoconnect-priority = "100";
    #             id = "Vodafone-9AA9";
    #             timestamp = "1777217708";
    #             type = "wifi";
    #             uuid = "f747136f-17ce-4723-8f26-0c05a197bad5";
    #         };
    #         ipv4 = {
    #             method = "auto";
    #             route-metric = "100";
    #         };
    #         ipv6 = {
    #             addr-gen-mode = "default";
    #             method = "auto";
    #             route-metric = "100";
    #         };
    #         proxy = { };
    #         wifi = {
    #             mode = "infrastructure";
    #             ssid = "Vodafone-9AA9";
    #         };
    #         wifi-security = {
    #             key-mgmt = "wpa-psk";
    #             psk = "";
    #         };
    #     };

    #     eduroam = {
    #         "802-1x" = {
    #             ca-cert = "/home/martin/Downloads/HARICA-TLS-Root-2021-RSA.pem";
    #             client-cert = "/home/martin/Downloads/Network_Certificate_martinw3_0892F0.p12";
    #             domain-suffix-match = "radius.uni-paderborn.de";
    #             eap = "tls";
    #             identity = "martinw3@uni-paderborn.de";
    #             private-key = "/home/martin/Downloads/Network_Certificate_martinw3_0892F0.p12";
    #             private-key-password = "";
    #         };
    #         connection = {
    #             autoconnect-priority = "100";
    #             id = "eduroam";
    #             interface-name = "wlp3s0";
    #             type = "wifi";
    #             uuid = "ef7cabca-0755-4637-97cd-14a0552e2dd9";
    #         };
    #         ipv4 = {
    #             method = "auto";
    #             route-metric = "100";
    #         };
    #         ipv6 = {
    #             addr-gen-mode = "stable-privacy";
    #             method = "auto";
    #             route-metric = "100";
    #         };
    #         proxy = { };
    #         wifi = {
    #             mac-address = "64:BC:58:54:76:49";
    #             mode = "infrastructure";
    #             ssid = "eduroam";
    #         };
    #         wifi-security = {
    #             key-mgmt = "wpa-eap";
    #         };
    #     };
    # };
}
