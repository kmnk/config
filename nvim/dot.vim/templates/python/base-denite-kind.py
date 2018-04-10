# {{_name_}}.py
"""
denite.nvim kind: {{_name_}}
"""

from denite.kind.base import Base

class Source(Base):
    def __init__(self, vim):
        super().__init__(vim)

        self.name = '{{_name_}}'
        self.default_action = 'run'

    def action_run(self, context):
        pass

def main(): pass

if __name__ == '__main__': main()
