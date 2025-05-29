{ pkgs, ... }:

{


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Set up for use of HP printer
  services.printing.drivers = with pkgs; [ hplipWithPlugin ];

  # Autodiscover network printer
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    avahi
    cups
    cups-filters
    cups-printers
    hplip # Print, scan and fax HP drivers for Linux
    hplipWithPlugin
    net-snmp
  ];

  # Open ports for printing in the firewall.
  networking.firewall = {
    allowedTCPPorts = [
      53
      443
      515
      631
    ];
    allowedTCPPortRanges = [
      {
        from = 9100;
        to = 9102;
      }
    ];
    allowedUDPPorts = [
      53
      161
      5353
      9100
    ];
  };

}





