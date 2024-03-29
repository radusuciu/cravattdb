"""empty message

Revision ID: b58403c860b5
Revises: fb445e98c6cc
Create Date: 2016-06-15 23:39:24.024664

"""

# revision identifiers, used by Alembic.
revision = 'b58403c860b5'
down_revision = 'fb445e98c6cc'

from alembic import op
import sqlalchemy as sa


def upgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('cell_type', 'name',
               existing_type=sa.INTEGER(),
               type_=sa.Text(),
               existing_nullable=True)
    op.alter_column('proteomic_fraction', 'name',
               existing_type=sa.INTEGER(),
               type_=sa.Text(),
               existing_nullable=True)
    ### end Alembic commands ###


def downgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('proteomic_fraction', 'name',
               existing_type=sa.Text(),
               type_=sa.INTEGER(),
               existing_nullable=True)
    op.alter_column('cell_type', 'name',
               existing_type=sa.Text(),
               type_=sa.INTEGER(),
               existing_nullable=True)
    ### end Alembic commands ###
