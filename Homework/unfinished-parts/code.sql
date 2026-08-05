SELECT
part, assembly_step
from parts_assembly
WHERE finish_date ISNULL;