import random
import string
import subprocess
import logging

class Puppet:
    """
    A class for network configuration and management.
    """
    
    def __init__(self, interface=None):
        """
        Initialize the Puppet class with an optional network interface.
        
        Args:
            interface (str): Network interface name (e.g., 'eth0', 'wlan0')
        """
        self.interface = interface
        self.logger = self._setup_logger()
    
    def _setup_logger(self):
        """
        Set up a logger for the class.
        
        Returns:
            logging.Logger: Configured logger instance
        """
        logger = logging.getLogger(__name__)
        logger.setLevel(logging.INFO)
        
        if not logger.handlers:
            handler = logging.StreamHandler()
            formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
            handler.setFormatter(formatter)
            logger.addHandler(handler)
        
        return logger
    
    def generate_random_filename(self, prefix="network_config_", extension=".py"):
        """
        Generate a random filename.
        
        Args:
            prefix (str): Prefix for the filename
            extension (str): File extension
            
        Returns:
            str: Random filename
        """
        random_chars = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
        return f"{prefix}{random_chars}{extension}"
    
    def set_interface(self, interface):
        """
        Set the network interface.
        
        Args:
            interface (str): Network interface name
        """
        self.interface = interface
        self.logger.info(f"Network interface set to: {interface}")
    
    def get_interface(self):
        """
        Get the current network interface.
        
        Returns:
            str: Current network interface name
        """
        return self.interface
    
    def configure_ip(self, ip_address, netmask="255.255.255.0"):
        """
        Configure IP address for the interface (Linux/Unix only).
        
        Args:
            ip_address (str): IP address to set
            netmask (str): Netmask for the IP address
        """
        if not self.interface:
            self.logger.error("No interface specified")
            return False
            
        try:
            # Using ip command (modern Linux)
            cmd = ["ip", "addr", "add", f"{ip_address}/{netmask}", "dev", self.interface]
            subprocess.run(cmd, check=True, capture_output=True)
            self.logger.info(f"IP address {ip_address} configured on {self.interface}")
            return True
        except subprocess.CalledProcessError as e:
            self.logger.error(f"Failed to configure IP: {e}")
            return False
        except Exception as e:
            self.logger.error(f"Unexpected error: {e}")
            return False
    
    def bring_up_interface(self):
        """
        Bring up the network interface (Linux/Unix only).
        
        Returns:
            bool: True if successful, False otherwise
        """
        if not self.interface:
            self.logger.error("No interface specified")
            return False
            
        try:
            cmd = ["ip", "link", "set", self.interface, "up"]
            subprocess.run(cmd, check=True, capture_output=True)
            self.logger.info(f"Interface {self.interface} brought up")
            return True
        except subprocess.CalledProcessError as e:
            self.logger.error(f"Failed to bring up interface: {e}")
            return False
        except Exception as e:
            self.logger.error(f"Unexpected error: {e}")
            return False
    
    def bring_down_interface(self):
        """
        Bring down the network interface (Linux/Unix only).
        
        Returns:
            bool: True if successful, False otherwise
        """
        if not self.interface:
            self.logger.error("No interface specified")
            return False
            
        try:
            cmd = ["ip", "link", "set", self.interface, "down"]
            subprocess.run(cmd, check=True, capture_output=True)
            self.logger.info(f"Interface {self.interface} brought down")
            return True
        except subprocess.CalledProcessError as e:
            self.logger.error(f"Failed to bring down interface: {e}")
            return False
        except Exception as e:
            self.logger.error(f"Unexpected error: {e}")
            return False
    
    def get_interface_info(self):
        """
        Get information about the network interface (Linux/Unix only).
        
        Returns:
            str: Interface information or error message
        """
        if not self.interface:
            self.logger.error("No interface specified")
            return "No interface specified"
            
        try:
            cmd = ["ip", "addr", "show", self.interface]
            result = subprocess.run(cmd, check=True, capture_output=True, text=True)
            return result.stdout
        except subprocess.CalledProcessError as e:
            self.logger.error(f"Failed to get interface info: {e}")
            return f"Error: {e}"
        except Exception as e:
            self.logger.error(f"Unexpected error: {e}")
            return f"Unexpected error: {e}"

# Example usage:
# puppet = Puppet("eth0")
# puppet.bring_up_interface()
# puppet.configure_ip("192.168.1.100")
# print(puppet.get_interface_info())
# puppet.bring_down_interface()