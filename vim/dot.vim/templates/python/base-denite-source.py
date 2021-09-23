# {{_name_}}.py
"""
denite.nvim source: {{_name_}}
"""

from denite.source.base import Base

class Source(Base):
    def __init__(self, vim):
        super().__init__(vim)

        self.name = '{{_name_}}'
        self.kind = '{{_name_}}'

    def gather_candidates(self, context):
        return []

def main(): pass

if __name__ == '__main__': main()
