python
import sys

sys.path.insert(0, '/home/cube/gdb_printers/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers(None)

sys.path.insert(0, '/home/cube/gdb_printers/Boost-Pretty-Printer')
from boost.printers import register_printer_gen
register_printer_gen(None)

end
