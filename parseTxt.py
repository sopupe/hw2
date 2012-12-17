# -*- coding: utf-8 -*-
import os, sys

print 'AO7L TEXT PARSER'
print sys.argv[1]+" -> "+sys.argv[2]

def fixBBCode(line,code,tagname):
	line=line.replace(u'['+code.lower()+']',u'<'+tagname+u'>') 
	line=line.replace(u'[/'+code.lower()+u']',u'</'+tagname+u'>')
	line=line.replace(u'['+code.upper()+']',u'<'+tagname+u'>') 
	line=line.replace(u'[/'+code.upper()+u']',u'</'+tagname+u'>')
	return line

with open(sys.argv[2],'w') as out:
	out.write(u'text = ""'.encode('utf8'))
	with open(sys.argv[1],'r') as inf:
		bracketOpen=False
		for ln, _line in enumerate(inf):
			line = _line.decode('utf8').replace(u'\n',u'')
			hasText=False
			commentlevel=0
			comment=''
			buffer=''
			line=line.replace(u'. . .',u'...') # Fix ellipses
			
			#BBCode
			line=fixBBCode(line,'b','b')
			line=fixBBCode(line,'i','i')
			
			for i, c in enumerate(line):
				#print u'[%d:%d] = %x' % (ln,i,c.encode('utf8'))
				if c == u']':
					commentlevel-=1
					if commentlevel < 0:
						commentlevel=0
					print 'Line %d, char %d: CLEVEL %d' % (ln,i,commentlevel)
					if commentlevel==0:
						if comment is not '':
							out.write((u"\n/* "+comment.strip()+u" */").encode('utf8'))
							comment=''
						continue
				if c == u'[':
					commentlevel+=1
					print 'Line %d, char %d: CLEVEL %d' % (ln,i,commentlevel)
					if buffer is not '':
						out.write((u'\ntext += "'+buffer.replace(u'"',u'&quot;').replace(u'{BR}',u'";\ntext += "').strip()+u'";').encode('utf8'))
						buffer=''
					if commentlevel == 1:
						continue
				if c in (u'“',u'”'):
					c = u'"'
				if commentlevel > 0:
					comment += c
				else:
					buffer += c
					if (len(buffer)%90) == 0:
						buffer += u'{BR}'
			if buffer is not '':
				out.write((u"\ntext += \"<p>"+buffer.replace(u'"',u"&quot;").replace(u'{BR}',u'";\ntext += "').strip()+u"</p>\";").encode('utf8'))
			if comment is not '':
				out.write((u"\n/* "+comment.strip()+u" */").encode('utf8'))